# Defined in - @ line 0
function lls --description 'alias ll=exa -l --get --classify -s mod'
	exa -l --git --classify -s mod $argv;
end
