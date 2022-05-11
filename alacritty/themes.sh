# alacritty themes
# requires https://github.com/toggle-corp/alacritty-colorscheme/ and pip install --user alacritty-colorscheme
LIGHT_COLOR='pencil_light.yaml'
DARK_COLOR='tender.yaml'
# alright themes:
# dark:
# - afterglow.yaml
# - ayu_dark.yaml
# - base16_default_dark.yaml
# - blood_moon.yaml
# - darcula.yaml - looks identical to dracula.yaml
# - gruvbox_dark.yaml
# - konsole_linux.yaml
# - one_dark.yaml
# - seashells.yaml
# - tender.yaml  # really nice
#
# light:
# - atom_one_light.yaml
# - night_owlish_light.yaml
# - pencil_light.yaml
# - solarized_light.yaml
# 

alias day="alacritty-colorscheme -C $HOME/.eendroroy-colorschemes/themes -V apply $LIGHT_COLOR"
alias night="alacritty-colorscheme -C $HOME/.eendroroy-colorschemes/themes -V apply $DARK_COLOR"
alias toggle="alacritty-colorscheme -C $HOME/.eendroroy-colorschemes/themes -V toggle $LIGHT_COLOR $DARK_COLOR"
