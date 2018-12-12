require 'spec_helper'

describe Pdf4me::OptimizeAction, type: :model do
  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe 'validations' do
    it { should validate_inclusion_of(:profile).in_array %w|default web print max| }
    it { should validate_inclusion_of(:dithering_mode).in_array %w|none floydSteinberg halftone pattern g3Optimized g4Optimized atkinson| }

    it { should validate_numericality_of(:image_quality).is_less_than_or_equal_to(100) }
    it { should validate_numericality_of(:image_quality).is_greater_than_or_equal_to(1) }
  end

  describe '.defaults' do
    it 'should give default values' do
      expect(subject.defaults[:profile]).to eq('default')
      expect(subject.defaults[:use_profile]).to eq(false)
      expect(subject.defaults[:remove_redundant_objects]).to eq(false)
      expect(subject.defaults[:subset_fonts]).to eq(false)
      expect(subject.defaults[:optimize_resources]).to eq(false)
      expect(subject.defaults[:force_compression_types]).to eq(false)
      expect(subject.defaults[:force_recompression]).to eq(false)
      expect(subject.defaults[:reduce_color_complexity]).to eq(false)
      expect(subject.defaults[:merge_embedded_fonts]).to eq(false)
      expect(subject.defaults[:bitonal_compressions]).to eq(['none'])
      expect(subject.defaults[:bitonal_resolution_dpi]).to eq(200)
      expect(subject.defaults[:bitonal_threshold_dpi]).to eq(-1)
      expect(subject.defaults[:clip_images]).to eq(false)
      expect(subject.defaults[:continuous_compressions]).to eq(['none'])
      expect(subject.defaults[:linearize]).to eq(false)
      expect(subject.defaults[:image_quality]).to eq(75)
      expect(subject.defaults[:dithering_mode]).to eq('none')
      expect(subject.defaults[:color_resolution_dpi]).to eq(150)
      expect(subject.defaults[:color_threshold_dpi]).to eq(-1)
      expect(subject.defaults[:monochrome_resolution_dpi]).to eq(150)
      expect(subject.defaults[:monochrome_threshold_dpi]).to eq(-1)
      expect(subject.defaults[:threshold_dpi]).to eq(-1)
      expect(subject.defaults[:strip]).to eq(['threads'])
      expect(subject.defaults[:flatten_signature_fields]).to eq(false)
    end
  end
end