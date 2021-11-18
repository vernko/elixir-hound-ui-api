defmodule FormAuthenticationTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  @tag :form
  @tag :ui
  test "can successfully login" do
    try do
      navigate_to "https://the-internet.herokuapp.com/"
      link = find_element(:link_text, "Form Authentication")
      click(link)

      click(find_element(:id, "username"))
      send_text("tomsmith")

      click(find_element(:id, "password"))
      send_text("SuperSecretPassword!")

      submit_element({:css, "[type='submit']"})

      assert element_displayed?({:class, "success"})
    rescue
      error ->
        take_screenshot()
        raise error
    end
  end

  @tag :form
  @tag :ui
  test "unsuccessful login message appears correctly" do
    try do
      navigate_to "https://the-internet.herokuapp.com/"
      link = find_element(:link_text, "Form Authentication")
      click(link)

      click(find_element(:id, "username"))
      send_text("tomsmith")

      click(find_element(:id, "password"))
      send_text("incorrectPassword!")

      submit_element({:css, "[type='submit']"})

      assert element_displayed?({:class, "error"})
    rescue
      error ->
        take_screenshot()
        raise error
    end
  end
end
