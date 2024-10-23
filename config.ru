class App
  def call(env)
    headers = { 'Content-Type' => 'text/html' }
    path = env['PATH_INFO'] # Get the path from the request

    response = case path
               when '/'
                 ['<h1>Welcome to the Home Page!</h1>']
               when '/about'
                 ['<h1>About Us</h1><p>This is the About page.</p>']
               when '/contact'
                 ['<h1>Contact Us</h1><p>Feel free to reach out!</p>']
               else
                 [404, { 'Content-Type' => 'text/html' }, ['<h1>404 Not Found</h1>']]
               end

    status = response.is_a?(Array) ? 200 : response[0] # Set status code
    body = response.is_a?(Array) ? response : response[2] # Get body content

    [status, headers, body]
  end
end

run App.new
