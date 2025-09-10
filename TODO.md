# TODO

- [ ] Add hover card with brief description of each book and cover image
- [ ] Add Dark mode
- [ ] Redo structure
  - Write Elixir script to generate markdown (or txt/html/toml) files for descriptions and HAML templates for each book (link on home page takes to `/{title}` which has cover image/description and links to download or view the PDF at `/{title}.pdf`)
    - Add download link with download icon
    ```html
      <a href="file.pdf" download="file.pdf">Download</a>
    ```
  - (*idea*) convert pdfs to html and include them on the site with account to hold your place/keep track of books
    - Use `ebook-convert {title}.pdf {title}.zip && unzip {title}.zip -d {title}/ && rm {title}.zip`
    - Use LLM to split into separate pages, get cover image, remove accidental text, apply necessary styling, etc
  - Add Elixir Nix flake that includes packages
  - Use GitHub Actions to run the script on every commit
- [ ] Add more works and make them in order (Use Princeton Hong volumes to standardize??)
