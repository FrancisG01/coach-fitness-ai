import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { brand } from "@coach/brand";
import App from "./App.tsx";

document.title = brand.name;

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <App />
  </StrictMode>,
);
