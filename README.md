# cluster-config
## Princeton research computing cluster configuration files

# Set-up
1. Clone the repository
2. **Either:** Set up symlinks to home directory `.vimrc` and `.tmux.conf` (using `ln -s [target] [name of link]`)

   **Or:** put these in `.vimrc` and `.tmux.conf` respectively to source files if they exist
    * Vim:
        ```
        if filereadable("/path/to/cluster-config/.vimrc")
            source /path/to/cluster-config/.vimrc
        endif
        ```
    * Tmux: 
        * `if-shell "test -f /path/to/cluster-config/.tmux.conf" "source /path/to/cluster-config/.tmux.conf"`
3. Source `.bash_profile` from `.bash_profile` or `.bashrc` if it exists:
```
export CONFIG_PATH="/path/to/cluster-config"
if [ -f "$CONFIG_PATH/.bash_profile" ]; then
    . "$CONFIG_PATH/.bash_profile"
fi
```
Other config files may use `CONFIG_PATH`, so make sure you export this environment variable in one of your `bash` configuration files.
