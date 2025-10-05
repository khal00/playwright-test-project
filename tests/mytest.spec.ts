import { test, expect } from '@playwright/test';

test('my test', async ({ page }) => {
  await page.goto('/');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/PlaywrightTestProject/);
});


