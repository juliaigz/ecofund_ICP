<script>
  // import { logoBurbujas } from "../../static/logoBurbujas.png";
  import ConnectPlug from "$lib/ConnectPlug.svelte";
  import Cards from "./Cards.svelte";
  import TransferPlug from "./TransferPlug.svelte";
  import {
    Header,
    HeaderNav,
    HeaderNavItem,
    HeaderNavMenu,
    SideNav,
    SideNavItems,
    SideNavMenu,
    SideNavMenuItem,
    SideNavLink,
    SideNavDivider,
    SkipToContent,
    Content,
    Grid,
    Row,
    Column,
  } from "carbon-components-svelte";
  // import { Theme } from "carbon-components-svelte";

  let isSideNavOpen = false;
</script>

<!-- <Header style="background-color: white; color: black;" expansionBreakpoint={1700} company="Ecofound" platformName="ICP" bind:isSideNavOpen> -->
<Header
  expansionBreakpoint={1700}
  company="Ecofound"
  platformName="ICP"
  bind:isSideNavOpen
>
  <svelte:fragment slot="skip-to-content">
    <SkipToContent />
  </svelte:fragment>
  <HeaderNav>
    <HeaderNavItem href="/" text="About" />
    <HeaderNavItem href="/" text="Help" />
    <HeaderNavItem href="/" text="Start a project" />
    <!-- <HeaderNavMenu text="Menu">
        <HeaderNavItem href="/" text="Link 1" />
        <HeaderNavItem href="/" text="Link 2" />
        <HeaderNavItem href="/" text="Link 3" />
      </HeaderNavMenu> -->
  </HeaderNav>
</Header>

<SideNav bind:isOpen={isSideNavOpen}>
  <SideNavItems>
    <SideNavLink text="About" />
    <SideNavLink text="Help" />
    <SideNavLink text="Start a project" />
    <!-- <SideNavMenu text="Menu">
        <SideNavMenuItem href="/" text="Link 1" />
        <SideNavMenuItem href="/" text="Link 2" />
        <SideNavMenuItem href="/" text="Link 3" />
      </SideNavMenu> -->
    <SideNavDivider />
    <!-- <Theme render="toggle" /> -->
  </SideNavItems>
</SideNav>

<Content>
  <!-- <Grid>
    <Row>
      <Column>
        <h1>Welcome</h1>
      </Column>
    </Row>
  </Grid> -->
  <Cards />
</Content>

<style>
</style>
