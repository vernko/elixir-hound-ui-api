defmodule HomeworkTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "goes to the internet" do
      navigate_to "https://the-internet.herokuapp.com/"
      assert("The Internet" == page_title())
  end
end
