module UsersHelper

def gravatar_for(user, size: 80 )
     gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    
    gravatar_url = "https://s.gravatar.com/avatar/bfbed9a363225708c7fc9f4ef5a97a49?s=80"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
 end
end
