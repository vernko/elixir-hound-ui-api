defmodule FormAuthenticationTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "can successfully login" do
    navigate_to "https://the-internet.herokuapp.com/"
    link = find_element(:link_text, "Form Authentication")
    click(link)

    click(find_element(:id, "username"))
    send_text("tomsmith")

    click(find_element(:id, "password"))
    send_text("SuperSecretPassword!")

    submit_element({:css, "[type='submit']"})

    assert element_displayed?({:class, "success"})
  end

  test "unsuccessful login message appears" do
    navigate_to "https://the-internet.herokuapp.com/"
    link = find_element(:link_text, "Form Authentication")
    click(link)

    click(find_element(:id, "username"))
    send_text("tomsmith")

    click(find_element(:id, "password"))
    send_text("incorrectPassword!")

    submit_element({:css, "[type='submit']"})

    assert element_displayed?({:class, "error"})
  end
end
