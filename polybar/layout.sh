#!/bin/bash

awesome-client 'return mouse.screen.selected_tag.layout.name' | cut -d "\"" -f 2
