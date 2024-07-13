<script>
  import {
    Header,
    HeaderUtilities,
    HeaderGlobalAction,
    SideNav,
    SideNavItems,
    SideNavMenu,
    SideNavMenuItem,
    SideNavLink,
    SideNavDivider,
    SkipToContent,
    Button,
    Content,
  } from "carbon-components-svelte";
  import {
    Menu,
    UserAvatarFilledAlt,
    SettingsAdjust,
    Logout,
    Fade,
  } from "carbon-icons-svelte";

  let isSideNavOpen = false;
  function isActionNav() {
    isSideNavOpen = !isSideNavOpen;
    console.log(isSideNavOpen);
  }
</script>

<Header company="Ecofound" platformName="ICP" bind:isSideNavOpen>
  <svelte:fragment slot="skip-to-content">
    <SkipToContent />
    <Button
      on:click={isActionNav}
      kind="tertiary"
      iconDescription="Nav Button"
      icon={Menu}
    />
  </svelte:fragment>
  <HeaderUtilities>
    <HeaderGlobalAction
      iconDescription="Settings"
      tooltipAlignment="start"
      icon={SettingsAdjust}
    />
    <HeaderGlobalAction iconDescription="Profile" icon={UserAvatarFilledAlt} />
    <HeaderGlobalAction
      iconDescription="Log out"
      tooltipAlignment="end"
      icon={Logout}
    />
  </HeaderUtilities>
</Header>

<SideNav bind:isOpen={isSideNavOpen} rail>
  <SideNavItems>
    <SideNavLink icon={Fade} text="Link 1" href="/" isSelected />
    <SideNavLink icon={Fade} text="Link 2" href="/" />
    <SideNavLink icon={Fade} text="Link 3" href="/" />
    <SideNavMenu icon={Fade} text="Menu">
      <SideNavMenuItem href="/" text="Link 1" />
      <SideNavMenuItem href="/" text="Link 2" />
      <SideNavMenuItem href="/" text="Link 3" />
    </SideNavMenu>
    <SideNavDivider />
    <SideNavLink icon={Fade} text="Link 4" href="/" />
  </SideNavItems>
</SideNav>
<Content>
    <slot />
</Content>
