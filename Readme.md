# Readme

Various dotfiles for auto system setup.


# Karabiner 

```json
// Complex modification: CAPS to ctr or escape
{
    "description": "CAPS to Ctrl or Escape",
    "manipulators": [
        {
            "from": { "key_code": "caps_lock" },
            "to": { "key_code": "left_control" },
            "to_if_alone": { "key_code": "escape" },
            "type": "basic"
        }
    ]
}
```