defmodule KeyPressesTest do
  #Import Helpers
  use Hound.Helpers
  use ExUnit.Case

  #Start hound session and destroy when tests are run
  hound_session()

  @tag :keypress
  @tag :ui
  test "enter backspace using send_keys" do
    try do
      navigate_to "https://the-internet.herokuapp.com/"
      link = find_element(:link_text, "Key Presses")
      click(link)

      click(find_element(:id, "target"))
      send_keys(:backspace)

      assert visible_text({:id, "result"}) == "You entered: BACK_SPACE"
    rescue
      error ->
        take_screenshot()
        raise error
    end
  end

  @tag :keypress
  @tag :ui
  test "enter 'typing all the stuff' using send_text" do
    try do
      navigate_to "https://the-internet.herokuapp.com/"
      link = find_element(:link_text, "Key Presses")
      click(link)

      click(find_element(:id, "target"))
      send_text("typing all the stuff")

      assert visible_text({:id, "result"}) == "You entered: typing all the stuff"
    rescue
      error ->
        take_screenshot()
        raise error
    end
  end
end
