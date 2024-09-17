<script>
  import {
    Header,
    HeaderNav,
    HeaderNavItem,
    SideNav,
    SideNavItems,
    SideNavLink,
    SideNavDivider,
    SkipToContent,
  } from "carbon-components-svelte";

  let isSideNavOpen = false;


  import { Button } from "carbon-components-svelte";

</script>

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
    <!-- <Button style="position:absolute; left:100%;">Wallet</Button> -->
  </HeaderNav>
  <Button style="position:absolute; left:90%;">Wallet</Button>
</Header>

<SideNav bind:isOpen={isSideNavOpen}>
  <SideNavItems>
    <SideNavLink text="About" />
    <SideNavLink text="Help" />
    <SideNavLink text="Start a project" />
    <SideNavDivider />
  </SideNavItems>
</SideNav>

<style>

  /* button{
    text-align: center;
    position: ;
  } */
</style>
