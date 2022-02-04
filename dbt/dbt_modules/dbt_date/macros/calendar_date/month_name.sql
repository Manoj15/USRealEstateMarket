{%- macro month_name(date, short=True) -%}
    {{ adapter.dispatch('month_name', packages = dbt_date._get_utils_namespaces()) (date, short) }}
{%- endmacro %}

{%- macro default__month_name(date, short) -%}
{%- set f = 'MON' if short else 'MONTH' -%}
    to_char({{ date }}, '{{ f }}')
{%- endmacro %}

{%- macro bigquery__month_name(date, short) -%}
{%- set f = '%b' if short else '%B' -%}
    format_date('{{ f }}', cast({{ date }} as date))
{%- endmacro %}

{%- macro snowflake__month_name(date, short) -%}
{%- set f = 'MON' if short else 'MMMM' -%}
    to_char({{ date }}, '{{ f }}')
{%- endmacro %}

{%- macro postgres__month_name(date, short) -%}
{# FM = Fill mode, which suppresses padding blanks #}
{%- set f = 'FMMon' if short else 'FMMonth' -%}
    to_char({{ date }}, '{{ f }}')
{%- endmacro %}
