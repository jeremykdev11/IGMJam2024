/// @description define vars

duration = 20;
typeSpeed = string_length(wordString)/duration;

typist = scribble_typist();
typist.in(typeSpeed, 0);

//wordLength = string_length(wordString) / typeSpeed;

alarm[0] = duration * 2;

wordString = "[wave]" + wordString;
word = scribble(wordString);

word.starting_format(drawFont, c_white);
word.align(fa_center, fa_middle);