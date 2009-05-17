module TwitterOAuth
  class Client
    CRLF = "\r\n"
    
    private
      # Properly encodes images in form/multipart specification for upload via OAuth.
      def http_multipart_data(params)
        body    = ""
        headers = {}
        
        boundary = Time.now.to_i.to_s(16)
        
        headers["Content-Type"] = "multipart/form-data; boundary=#{boundary}"
        params.each do |key,value|
          esc_key = OAuth::Helper.escape(key.to_s)
          body <<  "--#{boundary}#{CRLF}"
          
          if value.respond_to?(:read)
            mime_type = MIME::Types.type_for(value.path)[0] || MIME::Types["application/octet-stream"][0]
            body << "Content-Disposition: form-data; name=\"#{esc_key}\"; filename=\"#{File.basename(value.path)}\"#{CRLF}"
            body << "Content-Type: #{mime_type.simplified}#{CRLF*2}"
            body << value.read
          else
            body << "Content-Disposition: form-data; name=\"#{esc_key}\"#{CRLF*2}#{value}"
          end
        end
        
        body << "--#{boundary}--#{CRLF*2}"
        headers["Content-Length"] = body.size.to_s
        
        return [ body, headers ]
      end
  end
end