Fabricator(:product) do
  title { "Product #{sequence}" }
  body { "blah blah blah #{sequence}"}
end