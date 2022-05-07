;; bepo.nvim: bepo mapping for neovim
;; Copyright 2022 Clément Joly
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.
;;

(fn map-text-object [key target]
  "For text-objects mappings"
  (if (= (vim.fn.maprg key :o) "")
      (vim.api.nvim_set_keymap :o key target {:noremap true})
      (= (vim.fn.maprg key :x) "")
      (vim.api.nvim_set_keymap :x key target {:noremap true}))
  nil)

(fn map-all [key target]
  "For everything else"
  (if (= (vim.fn.maprg key :n) "")
      (vim.api.nvim_set_keymap :n key target {:noremap true})
      (map-text-object key target)))

(fn setup []
  (map-all :c :h))

{: setup}

