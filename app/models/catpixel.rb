class Catpixel
    def self.catpix_high_res(pic)
        Catpix::print_image pic,
            :limit_x => 0.5,
            :limit_y => 0,
            :center_x => true,
            :center_y => true,
            :bg => "black",
            :bg_fill => true,
            :resolution => "high"
    end
end