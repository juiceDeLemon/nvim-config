-- ██╗░░░░░██╗░░░██╗░█████╗░  ██╗░░░░░░██████╗██████╗░
-- ██║░░░░░██║░░░██║██╔══██╗  ██║░░░░░██╔════╝██╔══██╗
-- ██║░░░░░██║░░░██║███████║  ██║░░░░░╚█████╗░██████╔╝
-- ██║░░░░░██║░░░██║██╔══██║  ██║░░░░░░╚═══██╗██╔═══╝░
-- ███████╗╚██████╔╝██║░░██║  ███████╗██████╔╝██║░░░░░
-- ╚══════╝░╚═════╝░╚═╝░░╚═╝  ╚══════╝╚═════╝░╚═╝░░░░░

return {
    settings = {
        Lua = {
            completion = {
                displayContext = 4, -- understand the usage of symbol using 4 lines
                keywordSnippet = "Both", -- complete the whole keyward e.g.: if (true) {}
            },
            diagnostics = {
                globals = {
                    "vim"
                }, -- variable names that will be declared as global
            },
            format = {
                defaultConfig = {
                    -- PUT ALL OPTIONS HERE
                    -- reference:
                    -- https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/docs/format_config_EN.md
                    indent_style = "space",
                    indent_size = 4,
                    quote_style = "double",
                    call_arg_parentheses = "remove",
                    continuation_indent_size = 8,
                    local_assign_continuation_align_to_first_expression = true,
                    align_call_args = true,
                    align_function_define_params = true,
                    keep_one_space_between_table_and_bracket = true,
                    align_table_field_to_first_field = true,
                    keep_one_space_between_namedef_and_attribute = false,
                    max_continuous_line_distance = 80,
                    continuous_assign_statement_align_to_equal_sign = false,
                    continuous_assign_table_field_align_to_equal_sign = false,
                    label_no_indent = false,
                    do_statement_no_indent = false,
                    if_condition_no_continuation_indent = false,
                    table_append_expression_no_space = true,
                    if_condition_align_with_each_other = false,
                    -- reference:
                    -- https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/docs/diagnosis_config_EN.md
                    enable_check_code_style = true,
                    max_line_length = 80,
                    insert_final_newline = true,
                    enable_name_style_check = true,
                    local_name_define_style = "snake_case",
                    function_param_name_style = "snake_case",
                    function_name_define_style = "pascal_case",
                    local_function_name_define_style = "pascal_case",
                    table_field_name_define_style = "pascal_case",
                    global_variable_name_define_style = "camel_case",
                    module_name_define_style = "upper_snake_case",
                    require_module_name_style = "camel_case",
                    class_name_define_style = "pascal_case",
                }, -- custom code style
            },
            hint = {
                enable = true,
                arrayIndex = "Enable", -- label array index
            },
        },
    },
}

