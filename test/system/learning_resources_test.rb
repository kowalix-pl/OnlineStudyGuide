require "application_system_test_case"

class LearningResourcesTest < ApplicationSystemTestCase
  setup do
    @learning_resource = learning_resources(:one)
  end

  test "visiting the index" do
    visit learning_resources_url
    assert_selector "h1", text: "Learning Resources"
  end

  test "creating a Learning resource" do
    visit learning_resources_url
    click_on "New Learning Resource"

    check "Accessed" if @learning_resource.accessed
    fill_in "Reference", with: @learning_resource.reference
    click_on "Create Learning resource"

    assert_text "Learning resource was successfully created"
    click_on "Back"
  end

  test "updating a Learning resource" do
    visit learning_resources_url
    click_on "Edit", match: :first

    check "Accessed" if @learning_resource.accessed
    fill_in "Reference", with: @learning_resource.reference
    click_on "Update Learning resource"

    assert_text "Learning resource was successfully updated"
    click_on "Back"
  end

  test "destroying a Learning resource" do
    visit learning_resources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Learning resource was successfully destroyed"
  end
end
