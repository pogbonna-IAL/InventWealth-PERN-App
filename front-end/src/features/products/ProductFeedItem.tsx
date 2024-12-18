import { Link } from "react-router-dom";

import { ProductData } from "./productData";
import { getProductDetailPath, getProductImagePath } from "./utils";
import StarRating from "../../components/StarRating/StarRating";

import utilStyles from "../../App/utilStyles.module.css";
import styles from "./ProductFeedItem.module.css";


type ProductFeedItemProps = {
  productData: ProductData
}


export default function ProductFeedItem({ productData }: ProductFeedItemProps) {

  const detailPath = getProductDetailPath(productData.id, productData.name);
  const imagePath = getProductImagePath(productData.id, productData.name);
  const { avg_return, return_count, price } = productData;

  return (
    <article className={styles.feedItem}>
      <Link to={detailPath}>
        <img
          src={imagePath}
          alt={productData.name}
          height="500"
          width="500"
          className={styles.image}
        ></img>
      </Link>
      <div className={styles.textContainer}>
        <div className={utilStyles.mb1rem}>
          <Link to={detailPath} className={styles.nameLink}>
            <strong className={`${utilStyles.regularWeight} ${utilStyles.XLText}`}>{productData.name}</strong>
          </Link>
        </div>
        {avg_return ?
        <div className={styles.ratingContainer}>
          <StarRating rating={avg_return} />
          <span className={styles.returnCount}>{return_count}
          {return_count > 1 ? " ratings" : " rating"}
          </span>
        </div>
        : null}
        <div className={styles.price}>{"NGN"+" "+price+"M"}</div>
      </div> 
    </article>
  );
}
