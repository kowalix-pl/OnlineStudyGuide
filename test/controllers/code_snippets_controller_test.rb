require 'test_helper'

class CodeSnippetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @code_snippet = code_snippets(:one)
  end

  test "should get index" do
    get code_snippets_url
    assert_response :success
  end

  test "should get new" do
    get new_code_snippet_url
    assert_response :success
  end

  test "should create code_snippet" do
    assert_difference('CodeSnippet.count') do
      post code_snippets_url, params: { code_snippet: { code: @code_snippet.code } }
    end

    assert_redirected_to code_snippet_url(CodeSnippet.last)
  end

  test "should show code_snippet" do
    get code_snippet_url(@code_snippet)
    assert_response :success
  end

  test "should get edit" do
    get edit_code_snippet_url(@code_snippet)
    assert_response :success
  end

  test "should update code_snippet" do
    patch code_snippet_url(@code_snippet), params: { code_snippet: { code: @code_snippet.code } }
    assert_redirected_to code_snippet_url(@code_snippet)
  end

  test "should destroy code_snippet" do
    assert_difference('CodeSnippet.count', -1) do
      delete code_snippet_url(@code_snippet)
    end

    assert_redirected_to code_snippets_url
  end
end
