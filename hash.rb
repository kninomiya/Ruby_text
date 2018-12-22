require 'google/apis/customsearch_v1'
require 'json'

class LessonImageSearchContext
  @title = ""
  @site_url = ""
  @image_src = ""

  def initialize(title, site_url, image_src)
    @title = title
    @site_url = site_url
    @image_src = image_src
  end
  def data
    {
        title: @title,
        site_url: @site_url,
        image_src: @image_src
    }
  end
  def to_json()
    JSON.generate(data())
  end
end

class LessonImageSearchClient
  @api_key
  @cx
  def initialize(api_key, cx)
    @api_key = api_key
    @cx = cx
  end

  def findBy(keyword)

    result = { :count => 0, :images => []}

    search_client = Google::Apis::CustomsearchV1::CustomsearchService.new
    search_client.key = @api_key
    api_response = search_client.list_cses(keyword, {cx: @cx})

    api_response.items.each{|item|

      images = item.pagemap["cse_image"]
      if (images.any?)
        context = LessonImageSearchContext.new(
            item.title,
            item.formatted_url,
            images[0]["src"]
        )
        result[:images].push(context.data)
      else
        puts "No image for #{item.title} #{item.formatted_url}"
      end
    }

    # 件数を設定
    result[:count] = result[:images].length

    result
  end
end