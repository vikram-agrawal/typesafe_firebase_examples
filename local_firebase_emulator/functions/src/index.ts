/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import { logger, setGlobalOptions } from "firebase-functions";
import { onCall, CallableRequest, CallableResponse } from "firebase-functions/v2/https";
import express from "express";
import { userRouter } from "./user";
import { onRequest } from "firebase-functions/https";

// Start writing functions
// https://firebase.google.com/docs/functions/typescript

// For cost control, you can set the maximum number of containers that can be
// running at the same time. This helps mitigate the impact of unexpected
// traffic spikes by instead downgrading performance. This limit is a
// per-function limit. You can override the limit for each function using the
// `maxInstances` option in the function's options, e.g.
// `onRequest({ maxInstances: 5 }, (req, res) => { ... })`.
// NOTE: setGlobalOptions does not apply to functions using the v1 API. V1
// functions should each use functions.runWith({ maxInstances: 10 }) instead.
// In the v1 API, each function can only serve one request per container, so
// this will be the maximum concurrent request count.
setGlobalOptions({ maxInstances: 10 });

// export const helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

app.use("/user", userRouter);

export const userClient = onRequest({ region: "asia-south1" }, app);

export const streamClient = onCall(async (req: CallableRequest, res?: CallableResponse) => {
  logger.info("/streamClient called.");
  const words = ["Sending", "'Hello!'", "from", "streaming", "server."];
  let totalLength = 0;

  for (const word of words) {
    // Simulate asynchronous work
    await new Promise((resolve) => setTimeout(resolve, 500));

    // Send incremental chunk
    res!.sendChunk({ Value: word });
    logger.info(`Chunk sent: ${word}`);
    totalLength += word.length;
  }

  // Explicitly return the final result object
  return JSON.stringify({
    Value: totalLength
  });
});
