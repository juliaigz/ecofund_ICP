<script>
  import {
    Header,
    HeaderNav,
    HeaderNavItem,
    HeaderUtilities,
    SideNav,
    SideNavItems,
    SideNavLink,
    SideNavDivider,
    SkipToContent,
    HeaderGlobalAction,
    Modal,
    Content,
  } from "carbon-components-svelte";
  import { UserAvatarFilledAlt } from "carbon-icons-svelte";
  let isSideNavOpen = false;
  import InternetIdentity from "$lib/connect/InternetIdentity.svelte";

  let open = false;
</script>

<Header
  expansionBreakpoint={1700}
  company="EcoFund"
  platformName=" ICP"
  bind:isSideNavOpen
  href="/"
>
  <svelte:fragment slot="skip-to-content">
    <SkipToContent />
  </svelte:fragment>
  <HeaderNav>
    <HeaderNavItem href="/" text="About" />
    <HeaderNavItem href="/" text="Help" />
    <HeaderNavItem href="/startproject" text="Start a project" />
  </HeaderNav>
  <HeaderUtilities>
    <HeaderGlobalAction
      on:click={() => (open = true)}
      iconDescription="Profile"
      icon={UserAvatarFilledAlt}
    />
  </HeaderUtilities>
</Header>

<SideNav bind:isOpen={isSideNavOpen}>
  <SideNavItems>
    <SideNavLink text="About" />
    <SideNavLink text="Help" />
    <SideNavLink text="Start a project" />
    <SideNavDivider />
  </SideNavItems>
</SideNav>

<Modal
  passiveModal
  bind:open
  modalHeading="Connect a Wallet"
  on:click()
  on:open
  on:close
  on:submit
>

  <Content class="InternoModal">
    <p>
      Join us in supporting sustainable projects! By connecting a wallet, 
      you contribute your crypto donations seamlessly.
    </p>
    <InternetIdentity />
  </Content>

</Modal>

<style>
  /* button{
    text-align: center;
    position: ;
  } */


   :global(.InternoModal){
    background-color: rgba(185, 185, 185, 0.205);
   }
</style>
