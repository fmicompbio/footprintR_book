function Span(el)
  -- Check if the span contains the class "fn"
  for _, class in ipairs(el.classes) do
    if class == "fn" then
      local function_name = pandoc.utils.stringify(el.content)
      local url = "https://fmicompbio.github.io/footprintR/reference/" .. function_name .. ".html"
      -- Return a hyperlink with monospace formatting
      return pandoc.Link(pandoc.Code(function_name), url)
    elseif class == "cranpkg" then
      local package_name = pandoc.utils.stringify(el.content)
      local url = "https://cran.r-project.org/package=" .. package_name
      -- Return a hyperlink with monospace formatting
      return pandoc.Link(pandoc.Emph(package_name), url)
    elseif class == "biocpkg" then
      local package_name = pandoc.utils.stringify(el.content)
      local url = "https://bioconductor.org/packages/" .. package_name
      -- Return a hyperlink with monospace formatting
      return pandoc.Link(pandoc.Emph(package_name), url)
    elseif class == "githubpkg" then
      local repo_name = pandoc.utils.stringify(el.content)
      local url = "https://github.com/" .. repo_name
      local package_name = (repo_name):match '^[^/]+/(.+)$'
      -- print("Creating link for:", package_name, "->", url)
      -- Return a hyperlink with monospace formatting
      return pandoc.Link(pandoc.Emph(package_name), url)
    end
  end
end
