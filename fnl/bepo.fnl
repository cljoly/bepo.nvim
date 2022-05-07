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
;; Credit: Inspired by https://github.com/michamos/vim-bepo by Micha Moskovic

(fn map-text-object [key target]
  "For text-objects mappings"
  (vim.api.nvim_set_keymap :o key target {:noremap true})
  (vim.api.nvim_set_keymap :x key target {:noremap true})
  nil)

(fn map-visual [key target]
  "For normal mode mappings"
  (vim.api.nvim_set_keymap :v key target {:noremap true})
  nil)

(fn map-normal [key target]
  "For normal mode mappings"
  (vim.api.nvim_set_keymap :n key target {:noremap true})
  nil)

(fn map-all [key target]
  "For all directional mappings"
  (map-normal key target)
  (map-text-object key target))

(fn mapping-movement []
  ;; on préserve {hjkl} pour les directions
  (map-all :c :h)
  (map-all :t :j)
  (map-all :s :k)
  (map-all :r :l)
  (map-all :C :H)
  ;; ------
  ;; {JKL} devient [TSR]
  (map-all :T :J)
  (map-all :S :K)
  (map-all :R :L)
  ;; ------
  ;; on préserve les variantes avec 'g'
  (map-all :gt :gj)
  (map-all :gs :gk)
  ;; ------
  ;; on préserve les variantes avec 'z'
  (map-all :zj :zt)
  (map-all :zt :zj)
  (map-all :zk :zs)
  (map-all :zs :zk)
  ;; ------
  ;; {t} devient [h] pour être proche de [f]
  (map-all :h :t)
  ;; idem pour {T} et [H]
  (map-all :H :T)
  ;; {c} devient [l]
  (map-all :l :c)
  ;; {C} devient [L]
  (map-all :L :C)
  ;; {j} devient [r]
  (map-all :j :r)
  ;; {J} devient [R]
  (map-all :J :R)
  ;; {k} devient [s]
  (map-all :k :s)
  ;; {K} devient [S]
  (map-all :K :S))

(fn mapping-tabs []
  ;; le couple [gb]/[gé] agit sur les tabs
  (map-normal :gb :gT)
  (map-normal "gé" :gt)
  ;; [gB] va au premier tab
  (map-normal :gB ":execute \"silent! tabfirst\"<CR>")
  ;; [gÉ] au dernier
  (map-normal "gÉ" ":execute \"silent! tablast\"<CR>")
  ;; [gT] est libéré et peut agir sur les tags
  (map-normal :gT "<C-]>"))

(fn mapping-easy-access []
  ;; [<] est moins accessible que [«]
  (map-normal "«" "<")
  (map-visual "«" "<gv")
  ;; idem pour [»] et [>]
  (map-normal "»" ">")
  (map-visual "»" ">gv")
  ;; idem pour [g,] et [g;] qui sont permutés
  (map-all "g," "g;")
  (map-all "g;" "g,")
  ;; [w] est peu accessible, on utilise [é]
  (map-all "é" :w)
  ;; idem pour [W] et [É]
  (map-all "É" :W)
  ;; idem pour [aw] et [aé]
  (map-text-object "aé" :aw)
  ;; idem pour [aW] et [aÉ]
  (map-text-object "aÉ" :aW)
  ;; idem pour [iw] et [ié]
  (map-text-object "ié" :iw)
  ;; idem pour [iW] et [iÉ]
  (map-text-object "iÉ" :iW))

(fn mapping-window []
  ;; [w] est libre pour faire <C-w>
  (map-normal :w :<C-w>)
  ;; et [w] pour faire <C-w><C-w>
  (map-normal :W :<C-w><C-w>)
  ;; on map [w]+direction, miniscule + majuscule
  (map-normal :wc :<C-w>h)
  (map-normal :wt :<C-w>j)
  (map-normal :ws :<C-w>k)
  (map-normal :wr :<C-w>l)
  (map-normal :wC :<C-w>H)
  (map-normal :wT :<C-w>J)
  (map-normal :wS :<C-w>K)
  (map-normal :wR :<C-w>L)
  ;; crée un split _h_orizontal
  (map-normal :wh :<C-w>s)
  ;; va en haut à gauche
  (map-normal "wé" :<C-w>t)
  ;; déplace sur un nouveau tab
  (map-normal "wÉ" :<C-w>T))

(fn setup []
  "Keys that are still free:
  * , and ; as they may be used as leaders
  * à and À
  * è and È"
  (when (= vim.g.loaded_bepo_nvim nil)
    (mapping-movement)
    (mapping-tabs)
    (mapping-easy-access)
    (mapping-window)
    (set vim.g.loaded_bepo_nvim 1)))

{: setup
 :movement mapping-movement
 :tabs mapping-tabs
 :easy_access mapping-easy-access
 :window mapping-window}

