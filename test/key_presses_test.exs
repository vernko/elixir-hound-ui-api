defmodule KeyPressesTest do
  #Import Helpers
  use Hound.Helpers
  use ExUnit.Case

  #Start hound session and destroy when tests are run
  hound_session()

  test "enter backspace" do
    navigate_to "https://the-internet.herokuapp.com/"
    link = find_element(:link_text, "Key Presses")
    click(link)

    click(find_element(:id, "target"))
    send_keys(:backspace)

    assert visible_text({:id, "result"}) == "You entered: BACK_SPACE"
  end

  test "enter 'typing all the stuff'" do
    navigate_to "https://the-internet.herokuapp.com/"
    link = find_element(:link_text, "Key Presses")
    click(link)

    click(find_element(:id, "target"))
    send_text("typing all the stuff")
  end
end
