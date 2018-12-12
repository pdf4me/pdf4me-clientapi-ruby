require 'spec_helper'

describe Pdf4me::ImageAction, type: :model do
  it 'extends base Action' do
    expect(subject).to be_kind_of(Pdf4me::Base)
  end

  describe 'validations' do
    it { should validate_presence_of :image_extension }

    it { should validate_inclusion_of(:bits_per_pixel).in_array [1, 8, 24, 32] }
    it { should validate_inclusion_of(:rotate_mode).in_array %w|none attribute potrait landscape| }
    it { should validate_inclusion_of(:cms_engine).in_array %w|none neugebauer lcms customCMS| }
    it { should validate_inclusion_of(:dithering).in_array %w|none floydSteinberg halftone pattern g3Optimized g4Optimized atkinson| }
    it { should validate_inclusion_of(:fill_order).in_array %w|mSB ISB| }
    it { should validate_inclusion_of(:image_extension).in_array %w|jpg jpeg bmp gif jb2 jp2 jpf jpx png tif tiff| }
    it { should validate_inclusion_of(:color_space).in_array %w|RGB RGBA Gray GrayA CMYK YCbCR YCbCrK Palette LAB CMYK_Konly CMYKA| }
    it { should validate_inclusion_of(:compression).in_array %w|raw jPEG flate LZW group3 group3_2D group4 jBIG2 jPEG2000 tlFFJPEG| }

    it { should validate_numericality_of(:bilevel_threshold).is_less_than_or_equal_to(255) }
    it { should validate_numericality_of(:bilevel_threshold).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:image_quality).is_less_than_or_equal_to(100) }
    it { should validate_numericality_of(:image_quality).is_greater_than_or_equal_to(1) }
    it { should validate_numericality_of(:filter_ratio).is_less_than_or_equal_to(3) }
    it { should validate_numericality_of(:filter_ratio).is_greater_than_or_equal_to(1) }
  end

  describe '.defaults' do
    it 'should give the default values' do
      expect(subject.defaults[:center]).to eq(false)
      expect(subject.defaults[:fit_page]).to eq(true)
      expect(subject.defaults[:bits_per_pixel]).to eq(24)
      expect(subject.defaults[:bilevel_threshold]).to eq(181)
      expect(subject.defaults[:rotate_mode]).to eq('attribute')
      expect(subject.defaults[:preserve_aspect_ratio]).to eq(true)
      expect(subject.defaults[:image_quality]).to eq(80)
      expect(subject.defaults[:cms_engine]).to eq('lcms')
      expect(subject.defaults[:dithering]).to eq('floydSteinberg')
      expect(subject.defaults[:dpi]).to eq(150)
      expect(subject.defaults[:fill_order]).to eq('mSB')
      expect(subject.defaults[:filter_ratio]).to eq(1)
      expect(subject.defaults[:color_space]).to eq('RGB')
      expect(subject.defaults[:compression]).to eq('LZW')
    end
  end
end
