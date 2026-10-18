import { expect, test } from "@playwright/test";
import { brand } from "@coach/brand";

test("la página de inicio carga sin errores en la consola", async ({ page }) => {
  const problems: string[] = [];
  page.on("console", (msg) => {
    if (msg.type() === "error" || msg.type() === "warning") {
      problems.push(`${msg.type()}: ${msg.text()}`);
    }
  });
  page.on("pageerror", (error) => problems.push(`pageerror: ${error.message}`));

  await page.goto("/");

  await expect(page).toHaveTitle(brand.name);
  await expect(
    page.getByRole("heading", { name: `hola, soy ${brand.shortName}` }),
  ).toBeVisible();
  expect(problems).toEqual([]);
});
