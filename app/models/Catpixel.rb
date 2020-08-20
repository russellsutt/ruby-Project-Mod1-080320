class Catpixel
    def self.catpix_high(pic)
        Catpix::print_image pic,
        :limit_x => 0.5,
        :limit_y => 0,
        :center_x => true,
        :center_y => true,
        :bg => "black",
        :bg_fill => false,
        :resolution => "high"
    end
    def self.catpix_low(pic)
        Catpix::print_image pic,
        :limit_x => 0.5,
        :limit_y => 0,
        :center_x => true,
        :center_y => true,
        :bg => "black",
        :bg_fill => false,
        :resolution => "low"
    end
end