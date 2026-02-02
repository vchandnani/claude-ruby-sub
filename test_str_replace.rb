#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'str_replace'

class TestStrReplace < Minitest::Test
  # ============================================
  # SUNNY DAY (Happy Path) Scenarios
  # ============================================

  def test_simple_replacement
    result = StrReplace.replace("hello world", "world", "ruby")
    assert_equal "hello ruby", result
  end

  def test_multiple_occurrences
    result = StrReplace.replace("the cat and the dog", "the", "a")
    assert_equal "a cat and a dog", result
  end

  def test_replacement_at_beginning
    result = StrReplace.replace("hello world", "hello", "goodbye")
    assert_equal "goodbye world", result
  end

  def test_replacement_at_end
    result = StrReplace.replace("hello world", "world", "universe")
    assert_equal "hello universe", result
  end

  def test_replace_with_empty_string
    result = StrReplace.replace("hello world", "world", "")
    assert_equal "hello ", result
  end

  def test_replace_with_longer_string
    result = StrReplace.replace("hi", "hi", "hello there")
    assert_equal "hello there", result
  end

  def test_replace_with_shorter_string
    result = StrReplace.replace("hello", "hello", "hi")
    assert_equal "hi", result
  end

  def test_adjacent_occurrences
    result = StrReplace.replace("aaa", "a", "bb")
    assert_equal "bbbbbb", result
  end

  def test_overlapping_pattern_no_overlap
    # "aba" appears once, not overlapping
    result = StrReplace.replace("ababa", "aba", "X")
    assert_equal "Xba", result
  end

  def test_entire_string_is_pattern
    result = StrReplace.replace("test", "test", "replaced")
    assert_equal "replaced", result
  end

  def test_single_character_replacement
    result = StrReplace.replace("a.b.c", ".", "-")
    assert_equal "a-b-c", result
  end

  def test_count_occurrences_multiple
    count = StrReplace.count_occurrences("the cat and the dog and the bird", "the")
    assert_equal 3, count
  end

  def test_count_occurrences_single
    count = StrReplace.count_occurrences("hello world", "world")
    assert_equal 1, count
  end

  def test_count_occurrences_none
    count = StrReplace.count_occurrences("hello world", "xyz")
    assert_equal 0, count
  end

  # ============================================
  # RAINY DAY (Unhappy Path) Scenarios
  # ============================================

  def test_pattern_not_found
    result = StrReplace.replace("hello world", "xyz", "abc")
    assert_equal "hello world", result
  end

  def test_empty_source_string
    result = StrReplace.replace("", "search", "replace")
    assert_equal "", result
  end

  def test_empty_search_string
    result = StrReplace.replace("hello world", "", "replace")
    assert_equal "hello world", result
  end

  def test_nil_source_string
    result = StrReplace.replace(nil, "search", "replace")
    assert_nil result
  end

  def test_nil_search_string
    result = StrReplace.replace("hello world", nil, "replace")
    assert_equal "hello world", result
  end

  def test_nil_replace_string
    result = StrReplace.replace("hello world", "world", nil)
    assert_equal "hello ", result
  end

  def test_all_nil_inputs
    result = StrReplace.replace(nil, nil, nil)
    assert_nil result
  end

  def test_count_occurrences_empty_source
    count = StrReplace.count_occurrences("", "test")
    assert_equal 0, count
  end

  def test_count_occurrences_empty_search
    count = StrReplace.count_occurrences("hello world", "")
    assert_equal 0, count
  end

  def test_count_occurrences_nil_source
    count = StrReplace.count_occurrences(nil, "test")
    assert_equal 0, count
  end

  def test_count_occurrences_nil_search
    count = StrReplace.count_occurrences("hello world", nil)
    assert_equal 0, count
  end

  # ============================================
  # EDGE CASES
  # ============================================

  def test_source_and_search_same
    result = StrReplace.replace("hello", "hello", "")
    assert_equal "", result
  end

  def test_replace_with_same_string
    result = StrReplace.replace("hello world", "world", "world")
    assert_equal "hello world", result
  end

  def test_whitespace_handling
    result = StrReplace.replace("hello   world", "   ", " ")
    assert_equal "hello world", result
  end

  def test_special_characters
    result = StrReplace.replace("a*b+c?d", "*", "STAR")
    assert_equal "aSTARb+c?d", result
  end

  def test_newline_in_string
    result = StrReplace.replace("hello\nworld", "\n", " ")
    assert_equal "hello world", result
  end

  def test_tab_in_string
    result = StrReplace.replace("hello\tworld", "\t", " ")
    assert_equal "hello world", result
  end

  def test_unicode_characters
    result = StrReplace.replace("café résumé", "é", "e")
    assert_equal "cafe resume", result
  end

  def test_long_replacement_string
    result = StrReplace.replace("X", "X", "a" * 1000)
    assert_equal "a" * 1000, result
  end

  def test_case_sensitive
    result = StrReplace.replace("Hello World", "hello", "goodbye")
    assert_equal "Hello World", result  # No replacement - case mismatch
  end

  def test_result_is_new_string
    original = "hello world"
    result = StrReplace.replace(original, "world", "ruby")
    refute_same original, result  # Result should be a new string
    assert_equal "hello world", original  # Original unchanged
  end
end
