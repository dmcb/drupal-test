Feature: ls
	In order to see

Scenario: List 2 files in a directory
	Given I have a file named "foo"
	And I have a file named "bar"
	When I run "ls"
	Then I should see "foo" in the output
	And I should see "bar" in the output

