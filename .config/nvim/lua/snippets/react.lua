local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("javascript", {
  -- Styled Components
  s("styled", {
    t("import styled, { css } from 'styled-components';"),
    t({ "", "", "export const Container = styled.div`" }),
    t({ "", "\t${({ theme }) => css``}" }),
    t({ "", "`;" }),
    t(""),
  }),

  -- React Component
  s("component", {
    t("import P from 'prop-types';"),
    t({ "", "import * as Styled from './styles';", "" }),
    t("export const "),
    i(1, "ComponentName"),
    t(" = ({ children }) => {"),
    t({ "", "\treturn (" }),
    t({ "", "\t\t<Styled.Container>" }),
    t({ "", "\t\t\t<h1>{children}</h1>" }),
    t({ "", "\t\t</Styled.Container>" }),
    t({ "", "\t);" }),
    t({ "", "};", "" }),
    i(1, "ComponentName"),
    t(".propTypes = {"),
    t({ "", "\tchildren: P.node.isRequired," }),
    t({ "", "};", "" }),
  }),

  -- Storybook
  s("story", {
    t("import { "),
    i(1, "ComponentName"),
    t(" } from '.';"),
    t({ "", "", "export default {" }),
    t({ "", "\ttitle: '" }),
    i(1, "ComponentName"),
    t("',"),
    t({ "", "\tcomponent: " }),
    i(1, "ComponentName"),
    t(","),
    t({ "", "\targs: {" }),
    t({ "", "\t\tchildren: '" }),
    i(1, "ComponentName"),
    t("',"),
    t({ "", "\t}," }),
    t({ "", "\targTypes: {" }),
    t({ "", "\t\tchildren: { type: 'string' }," }),
    t({ "", "\t}," }),
    t({ "", "};", "" }),
    t("export const Template = (args) => {"),
    t({ "", "\treturn (" }),
    t({ "", "\t\t<div>" }),
    t({ "", "\t\t\t<" }),
    i(1, "ComponentName"),
    t(" {...args} />"),
    t({ "", "\t\t</div>" }),
    t({ "", "\t);" }),
    t({ "", "};", "" }),
  }),

  -- React Test
  s("test react", {
    t("import { screen } from '@testing-library/react';"),
    t({ "", "import { renderTheme } from '../../styles/render-theme';" }),
    t({ "", "import { " }),
    i(1, "ComponentName"),
    t(" } from '.';"),
    t({ "", "", "describe('<" }),
    i(1, "ComponentName"),
    t(" />', () => {"),
    t({ "", "\tit('should render', () => {" }),
    t({ "", "\t\trenderTheme(<" }),
    i(1, "ComponentName"),
    t(">Children</"),
    i(1, "ComponentName"),
    t(">);"),
    t({ "", "\t\texpect(screen.getByRole('heading')).toBeInTheDocument();" }),
    t({ "", "\t});" }),
    t({ "", "});", "" }),
  }),
})
