defmodule FailureScreenshotTest do
  #Import Helpers
  use Hound.Helpers
  use ExUnit.Case

  #Start hound session and destroy when tests are run
  hound_session()

  @tag :fail_test
  @tag :ui
  test "select dropdown" do
    try do
      navigate_to "https://the-internet.herokuapp.com/"
      link = find_element(:link_text, "Dropdown")
      click(link)

      find_element(:css, "#dropdown option[value='2']") |> click()
      sel_ele = find_element(:css, "[selected='selected']")
      assert visible_text(sel_ele) == "Option 1"
    rescue
      error ->
        take_screenshot()
        raise error
    end
  end
end
