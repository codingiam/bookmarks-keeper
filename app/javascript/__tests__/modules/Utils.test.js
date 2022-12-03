import { getCSRFfromHead } from "Utils.js";

test("getCSRFfromHead", () => {
  expect(getCSRFfromHead()).toBe("csrf_token");
});
