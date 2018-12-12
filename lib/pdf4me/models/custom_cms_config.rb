module Pdf4me
  class CustomCmsConfig < Base
    ATTRIBUTES = {
      white: 'RGBSet',
      c: 'RGBSet',
      m: 'RGBSet',
      y: 'RGBSet',
      k: 'RGBSet',
      cm: 'RGBSet',
      cy: 'RGBSet',
      ck: 'RGBSet',
      my: 'RGBSet',
      mk: 'RGBSet',
      yk: 'RGBSet',
      cmy: 'RGBSet',
      cmk: 'RGBSet',
      cyk: 'RGBSet',
      myk: 'RGBSet',
      cmyk: 'RGBSet'
    }
    attr_accessor *ATTRIBUTES.keys
  end
end