require "webstop-api/rest/coupons"
module WebstopApi
  module Interfaces
    module Coupons
      include WebstopApi::REST::Coupons

      def get_all_coupons(token, card_number = nil)
        _get_all_coupons(token: token, card_number: card_number).with_indifferent_access["coupons"]
      end

      def get_clipped_coupons(token)
        _get_clipped_coupons(token: token).with_indifferent_access[:coupons]
      end

      def get_coupon(id, token)
        _get_coupon(id, token: token).with_indifferent_access[:coupon]
      end

      def get_coupons_by_tag(card_number, tag, token)
        _get_coupons_by_tag(card_number: card_number, tag: tag, token: token)
      end

      def get_targeted_coupons(token)
        _get_targeted_coupons(token: token).with_indifferent_access["coupons"]
      end

      def clip_coupon(id, token, card_number = nil)
        if api_version == "v3"
          _clip_coupon(id: id, token: token).with_indifferent_access
        else
          _legacy_clip_coupon(id: id, token: token, card_number: card_number).with_indifferent_access
        end
      end

      def clip_coupon_by_tag(card_number, tag, token)
        _clip_coupon_by_tag(card_number: card_number, tag: tag, token: token)
      end
    end
  end
end
