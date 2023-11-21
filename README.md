## Getting Up and Running

- Download the latest version of chromedriver and ensure that your version of chrome is up to date as well
    - For example, if browser is version 95(my current version), use version 95 of chromedriver
- Run chromedriver using the terminal
    - Remember the location of the chromedriver, may need to run something like ```$ ./Projects/chromedriver``` to start chromedriver.
    - Chromedriver has to be running in order to run the tests.
- In a different terminal window or tab, cd into the project and you can now execute the command "mix test" and it will run all of the test files in the "test" folder

## Running Tests
As mentioned above, you can run the entire suite of test using ```mix test```. You can also run specific tests or test files. This can be done by the following:
- File Name
- Tags

### By File Name
To run tests in a specific file, you would run a command similar to this, ```mix test dropdown_test.exs```.

### By Tag
I have added tags to the different tests that gives us the ability to run specific tests if we wish.

This can be achieved by using options such as ```--exclude```, and ```--only```.

For example, if you only want to run the dropdown tests you could use this ```mix test --only="dropdown"```. This will only run tests that with the tag of ```dropdown```

For example, if you want to exclude just the dropdown tests, ```mix test --exclude="dropdown"```. This will run all the test except the tests with the tag of ```dropdown```.

If you would like more information about options we have to run with ```mix test```, check out the documentation here, [Mix Test Documentation](https://hexdocs.pm/mix/1.12/Mix.Tasks.Test.html)
