
# bash-find.md
- To find files with the same name in Linux, you can use the following command:

bash
`find ${/path/to/directory} -type f -name "${filename}"`

- To find files with the same name regardless of the filename in Linux, you can use the following command:


`find ${/path/to/directory} -type f -exec basename {} \; | sort | uniq -d`
