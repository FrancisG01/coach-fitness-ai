import { render, screen } from "@testing-library/react";
import { brand } from "@coach/brand";
import { describe, expect, it } from "vitest";
import App from "./App.tsx";

describe("App", () => {
  it("saluda con el nombre de la marca", () => {
    render(<App />);
    expect(
      screen.getByRole("heading", { name: `hola, soy ${brand.shortName}` }),
    ).toBeDefined();
  });
});
