# @see https://github.com/rswag/rswag/issues/174

# FIXM: Remember to access the same url as you define in swagger.yaml. Like if you use http://localhost:3000/api/v1 in `swagger.yaml`, then access http://localhost:3000/api-docs, not http://127.0.0.1:3000/api-docs

module Rswag::Ui::CSP
  def call env
    _, headers, _ = response = super
    headers['Content-Security-Policy'] = <<~POLICY.gsub "\n", ' '
      default-src 'self' localhost:3000;
      img-src 'self' data: https://online.swagger.io;
      font-src 'self' https://fonts.gstatic.com;
      style-src 'self' 'unsafe-inline' https://fonts.googleapis.com;
      script-src 'self' 'unsafe-inline' 'unsafe-eval';
    POLICY
    response
  end
end

Rswag::Ui::Middleware.prepend Rswag::Ui::CSP