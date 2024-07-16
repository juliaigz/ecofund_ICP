<script lang="ts">
  import { Section, Cta } from "flowbite-svelte-blocks";
  import { Button } from "flowbite-svelte";
  import { VideoCameraSolid } from "flowbite-svelte-icons";
</script>

<Section name="cta">
  <Cta>
    <svelte:fragment slot="h2"
      >Let's find more that brings us together.</svelte:fragment
    >
    <p class="mb-6 font-light text-gray-500 dark:text-gray-400 md:text-lg">
      Flowbite helps you connect with friends, family and communities of people
      who share your interests. Connecting with your friends and family as well
      as discovering new ones is easy with features like Groups, Watch and
      Marketplace.
    </p>
    <div class="flex flex-wrap items-center gap-4">
      <Button href="/" color="red" size="lg">Get started</Button>
      <Button href="/" color="light" size="lg"
        ><VideoCameraSolid class="mr-2 -ml-1" size="sm" />
        View more
      </Button>
    </div>
  </Cta>
</Section>
