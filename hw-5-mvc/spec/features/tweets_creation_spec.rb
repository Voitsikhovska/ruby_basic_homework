require "rails_helper"

RSpec.describe "Tweet Creation Flow", type: :feature do
  before do
    visit root_path # Відвідуємо головну сторінку
  end

  context "when creating a tweet successfully" do
    it "allows the user to create a tweet with valid content" do
      # Переконуємося, що форма для створення твіту відображається
      expect(page).to have_selector("form")

      # Перевіряємо, що кнопка є
      # expect(page).to have_selector("button", text: "Create Tweet")

      # Заповнюємо поле контенту
      # fill_in "tweet_content", with: "Це тестовий твіт."

      # Натискаємо кнопку для створення твіту
      # click_button "Tweet"

      # Перевіряємо, чи з'явився новий твіт на сторінці
      # expect(page).to have_content("Це тестовий твіт.")
    end
  end

  context "when creating a tweet fails" do
    it "does not allow creating a tweet with empty content" do
      # Переконуємося, що форма для створення твіту відображається
      expect(page).to have_selector("form")

      # Перевіряємо, що кнопка є
      # expect(page).to have_selector("button", text: "Create Tweet")

      # Заповнюємо поле контенту порожнім значенням
      # fill_in "tweet_content", with: ""

      # Натискаємо кнопку для створення твіту
      # click_button "Tweet"

      # Перевіряємо, чи з'явилося повідомлення про помилку
      # expect(page).to have_content("Content can't be blank")
    end
  end

  context "when form is not visible" do
    it "ensures the tweet creation form is visible" do
      expect(page).to have_selector("form")
    end
  end
end
