require "merton_planning_formatter/version"
require 'pragmatic_segmenter'

module MertonPlanningFormatter
  class Error < StandardError; end

  def self.format(s)
    ps = PragmaticSegmenter::Segmenter.new(text: s, language: 'en')

    sentences = ps.segment
    output = []

    sentences.each do |sentence|
      sentence = sentence.downcase.capitalize
      
      # Patterns have uppercase and lowercase alertnatives for the first letter to ensure that they match at the start of a sentence when the first letter will already be capitalised.

      # Abbreviations
      sentence.gsub! /\b[lL]bm\b/, 'LBM'
      sentence.gsub! /\b[lL]b\b/, 'LB'
      sentence.gsub! /\b[wW]c\b/, 'WC'
      
      sentence.gsub! /\b[lL]ondon borough of merton\b/, 'London Borough of Merton'
      sentence.gsub! /\b[mM]erton\b/, 'Merton'

      # Districts
      # https://en.wikipedia.org/wiki/London_Borough_of_Merton#Districts
      sentence.gsub! /\b[bB]ushey mead\b/, 'Bushey Mead'
      sentence.gsub! /\b[cC]olliers wood\b/, 'Colliers Wood'
      sentence.gsub! /\b[cC]opse hill\b/, 'Copse Hill'
      sentence.gsub! /\b[cC]ottenham park\b/, 'Cottenham Park'
      sentence.gsub! /\b[cC]rooked bill?ett?\b/, 'Crooked Billet'
      sentence.gsub! /\b[lL]ower morden\b/, 'Lower Morden'
      sentence.gsub! /\b[mM]erton park\b/, 'Merton Park'
      sentence.gsub! /\b[mM]itcham\b/, 'Mitcham'
      sentence.gsub! /\b[mM]itcham common\b/, 'Mitcham Common'
      sentence.gsub! /\b[mM]orden\b/, 'Morden'
      sentence.gsub! /\b[mM]orden park\b/, 'Morden Park'
      sentence.gsub! /\b[mM]otspur park\b/, 'Motspur Park'
      sentence.gsub! /\b[nN]ew malden\b/, 'New Malden'
      sentence.gsub! /\b[nN]orbury\b/, 'Norbury'
      sentence.gsub! /\b[pP]ollards hill\b/, 'Pollards Hill'
      sentence.gsub! /\b[rR]aynes park\b/, 'Raynes Park'
      sentence.gsub! /\b[sS]t\.? Helier\b/, 'St. Helier'
      sentence.gsub! /\b[sS]outh Wimbledon\b/, 'South Wimbledon'
      sentence.gsub! /\b[sS]ummerstown\b/, 'Summerstown'
      sentence.gsub! /\b[wW]imbledon\b/, 'Wimbledon'
      sentence.gsub! /\b[wW]imbledon park\b/, 'Wimbledon Park'
      
      # Use classes
      # https://www.planningportal.co.uk/info/200130/common_projects/9/change_of_use
      sentence.gsub! /\b[aA](\d)\b/, 'A\1'
      sentence.gsub! /\b[bB](\d)([abc]?)\b/, 'B\1\2'
      sentence.gsub! /\b[cC](\d)([abc]?)\b/, 'C\1\2'
      sentence.gsub! /\b[dD](\d)\b/, 'D\1'
      
      # Trees
      sentence.gsub! /\b[tT]po\b/, 'TPO'
      sentence.gsub! /\b[tT](\d+)\b/, 'T\1'
      sentence.gsub! /\b[mM]er(\d+)\b/, 'MER\1'
      sentence.gsub! /\b[mM](\d+)\b/, 'M\1'

      # Case reference numbers, eg 18/P1234
      sentence.gsub! /\b(\d{2})\/p(\d+)\b/, '\1/P\2'

      output << sentence
    end
  
    output.join(' ')
  end
end
