class Converter {
  String toUnicode(output) {
    final rules = [
      {
        "from": 'a',
        "to": 'ꓮ',
      },
      {
        "from": 'A',
        "to": 'ꓯ',
      },
      {
        "from": 'b',
        "to": 'ꓐ',
      },
      {
        "from": 'B',
        "to": 'ꓭ',
      },
      {
        "from": 'c',
        "to": 'ꓚ',
      },
      {
        "from": 'C',
        "to": 'ꓛ',
      },
      {
        "from": 'd',
        "to": 'ꓓ',
      },
      {
        "from": 'D',
        "to": 'ꓷ',
      },
      {
        "from": 'e',
        "to": 'ꓰ',
      },
      {
        "from": 'E',
        "to": 'ꓱ',
      },
      {
        "from": 'f',
        "to": 'ꓝ',
      },
      {
        "from": 'F',
        "to": 'ꓞ',
      },
      {
        "from": 'g',
        "to": 'ꓖ',
      },
      {
        "from": 'G',
        "to": 'ꓨ',
      },
      {
        "from": 'h',
        "to": 'ꓧ',
      },
      {
        "from": 'i',
        "to": 'ꓲ',
      },
      {
        "from": 'I',
        "to": '꓾',
      },
      {
        "from": 'j',
        "to": 'ꓙ',
      },
      {
        "from": 'J',
        "to": 'ꓩ',
      },
      {
        "from": 'k',
        "to": 'ꓗ',
      },
      {
        "from": 'K',
        "to": 'ꓘ',
      },
      {
        "from": 'l',
        "to": 'ꓡ',
      },
      {
        "from": 'L',
        "to": 'ꓶ',
      },
      {
        "from": 'm',
        "to": 'ꓟ',
      },
      {
        "from": 'n',
        "to": 'ꓠ',
      },
      {
        "from": 'o',
        "to": 'ꓳ',
      },
      {
        "from": 'O',
        "to": 'ˍ',
      },
      {
        "from": 'p',
        "to": 'ꓑ',
      },
      {
        "from": 'P',
        "to": 'ꓒ',
      },
      {
        "from": 'r',
        "to": 'ꓣ',
      },
      {
        "from": 'R',
        "to": 'ꓤ',
      },
      {
        "from": 's',
        "to": 'ꓢ',
      },
      {
        "from": 't',
        "to": 'ꓔ',
      },
      {
        "from": 'T',
        "to": 'ꓕ',
      },
      {
        "from": 'u',
        "to": 'ꓴ',
      },
      {
        "from": 'U',
        "to": 'ꓵ',
      },
      {
        "from": 'v',
        "to": 'ꓦ',
      },
      {
        "from": 'V',
        "to": 'ꓥ',
      },
      {
        "from": 'w',
        "to": 'ꓪ',
      },
      {
        "from": 'x',
        "to": 'ꓫ',
      },
      {
        "from": 'y',
        "to": 'ꓬ',
      },
      {
        "from": 'z',
        "to": 'ꓜ',
      },
      {
        "from": '\\[',
        "to": 'ʼ',
      },
      {
        "from": ',',
        "to": 'ꓹ',
      },
      {
        "from": 'H',
        "to": 'ꓺ',
      },
      {
        "from": 'Y',
        "to": 'ꓻ',
      },
      {
        "from": ';',
        "to": 'ꓼ',
      },
      {
        "from": ':',
        "to": 'ꓽ',
      },
      {
        "from": '=',
        "to": '꓿',
      },
      {
        "from": ' ',
        "to": ' ',
      },
      {
        "from": 'Q',
        "to": 'ꓺꓽ',
      },
      {
        "from": 'S',
        "to": 'ꓸꓼ',
      },
      {
        "from": 'W',
        "to": 'ꓹꓼ',
      },
      {
        "from": 'q',
        "to": 'ꓻꓽ',
      },
      {
        "from": '`',
        "to": 'ꓺꓼ',
      },
      {
        "from": 'Z',
        "to": '“',
      },
      {
        "from": 'X',
        "to": '”',
      },
      {
        "from": '\\.',
        "to": 'ꓸ',
      },
    ];

    return replace_with_rule(rules, output);
  }

  String toNonUnicode(output) {
    final rules = [
      {
        "to": 'a',
        "from": 'ꓮ',
      },
      {
        "to": 'A',
        "from": 'ꓯ',
      },
      {
        "to": 'b',
        "from": 'ꓐ',
      },
      {
        "to": 'B',
        "from": 'ꓭ',
      },
      {
        "to": 'c',
        "from": 'ꓚ',
      },
      {
        "to": 'C',
        "from": 'ꓛ',
      },
      {
        "to": 'd',
        "from": 'ꓓ',
      },
      {
        "to": 'D',
        "from": 'ꓷ',
      },
      {
        "to": 'e',
        "from": 'ꓰ',
      },
      {
        "to": 'E',
        "from": 'ꓱ',
      },
      {
        "to": 'f',
        "from": 'ꓝ',
      },
      {
        "to": 'F',
        "from": 'ꓞ',
      },
      {
        "to": 'g',
        "from": 'ꓖ',
      },
      {
        "to": 'G',
        "from": 'ꓨ',
      },
      {
        "to": 'h',
        "from": 'ꓧ',
      },
      {
        "to": 'i',
        "from": 'ꓲ',
      },
      {
        "to": 'I',
        "from": '꓾',
      },
      {
        "to": 'j',
        "from": 'ꓙ',
      },
      {
        "to": 'J',
        "from": 'ꓩ',
      },
      {
        "to": 'k',
        "from": 'ꓗ',
      },
      {
        "to": 'K',
        "from": 'ꓘ',
      },
      {
        "to": 'l',
        "from": 'ꓡ',
      },
      {
        "to": 'L',
        "from": 'ꓶ',
      },
      {
        "to": 'm',
        "from": 'ꓟ',
      },
      {
        "to": 'n',
        "from": 'ꓠ',
      },
      {
        "to": 'o',
        "from": 'ꓳ',
      },
      {
        "to": 'O',
        "from": 'ˍ',
      },
      {
        "to": 'p',
        "from": 'ꓑ',
      },
      {
        "to": 'P',
        "from": 'ꓒ',
      },
      {
        "to": 'r',
        "from": 'ꓣ',
      },
      {
        "to": 'R',
        "from": 'ꓤ',
      },
      {
        "to": 's',
        "from": 'ꓢ',
      },
      {
        "to": 't',
        "from": 'ꓔ',
      },
      {
        "to": 'T',
        "from": 'ꓕ',
      },
      {
        "to": 'u',
        "from": 'ꓴ',
      },
      {
        "to": 'U',
        "from": 'ꓵ',
      },
      {
        "to": 'v',
        "from": 'ꓦ',
      },
      {
        "to": 'V',
        "from": 'ꓥ',
      },
      {
        "to": 'w',
        "from": 'ꓪ',
      },
      {
        "to": 'x',
        "from": 'ꓫ',
      },
      {
        "to": 'y',
        "from": 'ꓬ',
      },
      {
        "to": 'z',
        "from": 'ꓜ',
      },
      {
        "to": '\\[',
        "from": 'ʼ',
      },
      {
        "to": ',',
        "from": 'ꓹ',
      },
      {
        "to": 'H',
        "from": 'ꓺ',
      },
      {
        "to": 'Y',
        "from": 'ꓻ',
      },
      {
        "to": ';',
        "from": 'ꓼ',
      },
      {
        "to": ':',
        "from": 'ꓽ',
      },
      {
        "to": '=',
        "from": '꓿',
      },
      {
        "to": ' ',
        "from": ' ',
      },
      {
        "to": 'Q',
        "from": 'ꓺꓽ',
      },
      {
        "to": 'S',
        "from": 'ꓸꓼ',
      },
      {
        "to": 'W',
        "from": 'ꓹꓼ',
      },
      {
        "to": 'q',
        "from": 'ꓻꓽ',
      },
      {
        "to": '`',
        "from": 'ꓺꓼ',
      },
      {
        "to": 'Z',
        "from": '“',
      },
      {
        "to": 'X',
        "from": '”',
      },
      {
        "to": '\.',
        "from": 'ꓸ',
      },
    ];

    return this.replace_with_rule(rules, output);
  }

  String replace_with_rule(rule, output) {
    var max_loop = rule.length;
    for (var i = 0; i < max_loop; i++) {
      var data = rule[i];
      var from = data['from'];
      var to = data['to'];

      var from_regex = new RegExp(from);
      output = output.replaceAll(from_regex, to);
    }
    return output;
  }
}
