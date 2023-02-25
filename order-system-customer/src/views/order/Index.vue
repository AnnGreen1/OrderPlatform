<template>
    <div>
        <h1>order</h1>
    </div>
</template>

<script>
import { initBanner } from "@/api/home";
export default {
    data() {
        return {

        };
    },
    methods: {
        initBanner() {
            initBanner()
                .then((res) => {
                    console.log(res);
                    if (res && res.code == 1001 && res.data) {
                        this.banner = res.data;
                    }
                })
                .catch((error) => {
                    console.log(error);
                });
        }
    },
    created() {

        this.initBanner()
    },
};
</script>