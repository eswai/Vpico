# Initialize a Keyboard
kbd = Keyboard.new

# Initialize GPIO assign
kbd.init_pins(
  #[ 8, 9, 10, 11, 12 ], # row0, row1,... respectively
  #[ 2, 3, 4, 5, 6, 7 ]  # col0, col1,... respectively
  # If you put USB port on the right side, use below instead
  [ 7, 8, 9, 10 ],
  [ 15, 14, 13, 12, 11, 20, 19, 18, 17, 16]
)

# default layer should be added at first
# +---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
kbd.add_layer :default, %i[
  KC_Q      KC_W      KC_E      KC_R      KC_T      KC_Y      KC_U      KC_I      KC_O      KC_P     
  KC_A      KC_S      KC_D      KC_F      KC_G      KC_H      KC_J      KC_K      KC_L      KC_SCOLON
  KC_Z      KC_X      KC_C      KC_V      KC_B      KC_N      KC_M      KC_COMMA  KC_DOT    KC_SLASH 
  KC_LCTL   KC_LGUI   KC_LSFT   LOWER     SFTSPC    SFTENT    RAISE     KC_LALT   KC_TAB    KC_QUOTE    
]
# +---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
kbd.add_layer :raise, %i[
  KC_TILD   KC_AT     KC_HASH   KC_DLR    KC_NO     KC_NO     KC_HOME   KC_UP     KC_END    KC_BSPACE   
  KC_CIRC   KC_AMPR   KC_QUES   KC_PERC   KC_QUOTE  KC_NO     KC_LEFT   KC_DOWN   KC_RIGHT  KC_DELETE 
  KC_GRAVE  KC_PIPE   KC_EXLM   KC_UNDS   KC_BSLASH KC_NO     KC_NO     KC_NO     KC_NO     KC_NO
  KC_LCTL   KC_GUI    KC_LSFT   LOWER     KC_SPACE  KC_ENTER  RAISE     KC_LALT   KC_NO     KC_NO     
]
# +---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
kbd.add_layer :lower, %i[
  KC_ESCAPE KC_NO      KC_COLN  KC_SCOLON KC_NO     KC_SLASH  KC_7      KC_8      KC_9      KC_MINUS
  KC_NO    KC_LBRACKET KC_LCBR  KC_LPRN   KC_LT     KC_ASTER  KC_4      KC_5      KC_6      KC_PLUS
  KC_NO    KC_RBRACKET KC_RCBR  KC_RPRN   KC_GT     KC_0      KC_1      KC_2      KC_3      KC_EQUAL  
  KC_LCTL  KC_LGUI     KC_LSFT  LOWER     KC_SPACE  KC_ENTER  RAISE     KC_LALT   KC_NO     KC_NO     
]
# +---------+---------+---------+---------+---------+---------+---------+---------+---------+---------

# Tip: You can also switch current layer by single click like this:
kbd.define_mode_key :RAISE,      [ nil, :raise , nil, nil ]
kbd.define_mode_key :LOWER,      [ nil, :lower , nil, nil ]
kbd.define_mode_key :SFTSPC,     [ :KC_SPACE, :KC_LSFT, 150, 150 ]
kbd.define_mode_key :SFTENT,     [ :KC_ENTER, :KC_LSFT, 150, 150 ]

# Initialize RGBLED with pin, underglow_size, backlight_size and is_rgbw.
rgb = RGB.new(
  21,    # pin number
  0,    # size of underglow pixel
  1,   # size of backlight pixel
  false # 32bit data will be sent to a pixel if true while 24bit if false
)
# Set an effect
#  `nil` or `:off` for turning off, `:breathing` for "color breathing", `:rainbow` for "rainbow snaking"
# rgb.effect = :rainbow
rgb.effect = :off
# Set an action when you input
#  `nil` or `:off` for turning off
# rgb.action = :thunder
# Append the feature. Will possibly be able to write `Keyboard#append(OLED.new)` in the future
kbd.append rgb

kbd.start!
