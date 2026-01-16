import { Request, Response, Router } from "express";
import { Request as FunctionsRequest } from 'firebase-functions/https';
import { logger } from "firebase-functions";
import { CallableRequest, CallableResponse, onCall } from "firebase-functions/https";

const parseData = (req: Request): any => {
  if (typeof req.body?.data === "string") {
    try {
      return JSON.parse(req.body.data);
    } catch (e) {
      logger.error("Failed to parse JSON string from req.body.data", e);
      throw new Error("Invalid JSON string in data field");
    }
  }
  return req.body?.data;
};

export const userRouter = Router()

userRouter.post("/load", (req: Request, res: Response) => {
  logger.info("/load called.");
  const data = parseData(req);
  logger.info(`Value: ${data.Value}`);
  res.status(200).json({
    success: true,
    data: {
      uid: data.Value,
      name: `User_${data.Value}`
    }
  });
});

const streamClient = onCall(async (_: CallableRequest, res?: CallableResponse) => {
  logger.info("/streamClient called.");
  const words = ["Sending", "'Hello!'", "from", "streaming", "server."];
  let totalLength = 0;

  for (const word of words) {
    // Simulate asynchronous work
    await new Promise((resolve) => setTimeout(resolve, 500));

    // Send incremental chunk
    await res!.sendChunk({ Value: word });
    logger.info(`Chunk sent: ${word}`);
    totalLength += word.length;
  }

  // Explicitly return the final result object
  return JSON.stringify({
    Value: totalLength
  });
});


userRouter.post("/stream", async (req: Request, res: Response) => {
  streamClient(req as FunctionsRequest, res);
});
