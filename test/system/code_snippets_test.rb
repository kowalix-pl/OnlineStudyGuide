require "application_system_test_case"

class CodeSnippetsTest < ApplicationSystemTestCase
  setup do
    @code_snippet = code_snippets(:one)
  end

  test "visiting the index" do
    visit code_snippets_url
    assert_selector "h1", text: "Code Snippets"
  end

  test "creating a Code snippet" do
    visit code_snippets_url
    click_on "New Code Snippet"

    fill_in "Code", with: @code_snippet.code
    click_on "Create Code snippet"

    assert_text "Code snippet was successfully created"
    click_on "Back"
  end

  test "updating a Code snippet" do
    visit code_snippets_url
    click_on "Edit", match: :first

    fill_in "Code", with: @code_snippet.code
    click_on "Update Code snippet"

    assert_text "Code snippet was successfully updated"
    click_on "Back"
  end

  test "destroying a Code snippet" do
    visit code_snippets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Code snippet was successfully destroyed"
  end
end
